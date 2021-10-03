*** Settings ***
Library  RequestsLibrary
Library  Collections
*** Variables ***
${base_url}  https://skillacademy.com
${serachitem}  bisnis
${page}  4
${pageSize}  2
${minPrice}  200000
${maxPrice}  300000
${minDuration}  0
${maxDuration}  1
${order}  price
${success}  success

*** Keywords ***
Check Basic Search
    create session  mysession  https://skillacademy.com  verify=true
    ${response}=  GET REQUEST  mysession  /skillacademy/discovery/search?searchQuery=${serachitem}

    #Validations
    #check status OK 200
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200
    #check body contain search item
    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${serachitem}
    #check Header content type
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

Check Pagination Search
    create session  mysession  https://skillacademy.com  verify=true
    ${response}=  GET REQUEST  mysession  /skillacademy/discovery/search?searchQuery=${serachitem}&page=${page}&pageSize=${pageSize}

    #Validations
    #check status OK 200
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200
    #check body contain search item
    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${serachitem}
    #check Header content type
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    ${json}=  set variable  ${response.json()}
    #check page
    should be equal as strings  ${json['data']['page']}  ${page}
    #check pagesize
    should be equal as strings  ${json['data']['pageSize']}  ${pageSize}
    #check status
    should be equal as strings  ${json['status']}  ${success}
    #check message
    should be equal as strings  ${json['message']}  ${success}

Check Price Search
    create session  mysession  https://skillacademy.com  verify=true
    ${response}=  GET REQUEST  mysession  /skillacademy/discovery/search?searchQuery=${serachitem}&page=${page}&pageSize=${pageSize}&minPrice=${minPrice}&maxPrice=${maxPrice}

    #Validations
    #check status OK 200
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200
    #check body contain search item
    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${serachitem}
    #check Header content type
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    ${json}=  set variable  ${response.json()}
    #check page
    should be equal as strings  ${json['data']['page']}  ${page}
    #check pagesize
    should be equal as strings  ${json['data']['pageSize']}  ${pageSize}
    #check status
    should be equal as strings  ${json['status']}  ${success}
    #check message
    should be equal as strings  ${json['message']}  ${success}
    #check price
    ${price}=  convert to number  ${json['data']['data'][0]['price']}
    ${min}=  convert to number  ${minPrice}
    ${max}=  convert to number  ${maxPrice}
    should be true  ${price}>${min} and ${price}<${maxPrice}

Check Duration Search
    create session  mysession  https://skillacademy.com  verify=true
    ${response}=  GET REQUEST  mysession  /skillacademy/discovery/search?searchQuery=${serachitem}&page=${page}&pageSize=${pageSize}&minPrice=${minPrice}&maxPrice=${maxPrice}&minDuration=${minDuration}&maxDuration=${maxDuration}

    #Validations
    #check status OK 200
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200
    #check body contain search item
    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${serachitem}
    #check Header content type
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    ${json}=  set variable  ${response.json()}
    #check page
    should be equal as strings  ${json['data']['page']}  ${page}
    #check pagesize
    should be equal as strings  ${json['data']['pageSize']}  ${pageSize}
    #check status
    should be equal as strings  ${json['status']}  ${success}
    #check message
    should be equal as strings  ${json['message']}  ${success}
    #check price
    ${price}=  convert to number  ${json['data']['data'][0]['price']}
    ${min}=  convert to number  ${minPrice}
    ${max}=  convert to number  ${maxPrice}
    should be true  ${price}>${min} and ${price}<${maxPrice}

Check Order Search
    create session  mysession  https://skillacademy.com  verify=true
    ${response}=  GET REQUEST  mysession  /skillacademy/discovery/search?searchQuery=${serachitem}&page=${page}&pageSize=${pageSize}&minPrice=${minPrice}&maxPrice=${maxPrice}&minDuration=${minDuration}&maxDuration=${maxDuration}&sortBy=${order}&orderBy=${order}

    #Validations
    #check status OK 200
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200
    #check body contain search item
    ${body}=  convert to string  ${response.content}
    should contain  ${body}  ${serachitem}
    #check Header content type
    ${contentTypeValue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contentTypeValue}  application/json

    ${json}=  set variable  ${response.json()}
    #check page
    should be equal as strings  ${json['data']['page']}  ${page}
    #check pagesize
    should be equal as strings  ${json['data']['pageSize']}  ${pageSize}
    #check status
    should be equal as strings  ${json['status']}  ${success}
    #check message
    should be equal as strings  ${json['message']}  ${success}
    #check price
    ${price}=  convert to number  ${json['data']['data'][0]['price']}
    ${min}=  convert to number  ${minPrice}
    ${max}=  convert to number  ${maxPrice}
    should be true  ${price}>${min} and ${price}<${maxPrice}

