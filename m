Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x235.google.com ([2607:f8b0:4002:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqlix-00088c-IP
 for ath10k@lists.infradead.org; Mon, 26 Oct 2015 17:38:25 +0000
Received: by ykba4 with SMTP id a4so185542747ykb.3
 for <ath10k@lists.infradead.org>; Mon, 26 Oct 2015 10:38:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <562E42CB.4090809@candelatech.com>
References: <CAGJdtRAxPKvNZAZK=YMTGd0mJKP=e2gatyofPz-1KpPj_kU5Rw@mail.gmail.com>
 <562E42CB.4090809@candelatech.com>
Date: Tue, 27 Oct 2015 01:38:01 +0800
Message-ID: <CAGJdtRDAZzcJG1Cx7TTHL0iPa6GP1jq3eQNf9qTwhn=pnzKqMg@mail.gmail.com>
Subject: Re: Specific MAC address impact performance
From: Yu-Chieh <jay0607@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Hi Ben,
I also geuss that mignt be BSSID mask issue, however i have no idea
about the patten
I can find bssid_mask function in ath5k and ath9k but not in ath10k.
Do your suggest me to use XX:XX:XX:YY:YY:XX, XX should be same and YY
could be different?

Thanks.

Jay

2015-10-26 23:12 GMT+08:00 Ben Greear <greearb@candelatech.com>:
> Your probably have BSSID mask collision.  Rule of thumb is to leave
> all octets the same except the second and third (from the right)
> byte.  That usually gives you unique masks assuming the right-most
> byte is unique for your radios.
>
> Thanks,
> Ben
>
>
>
> On 10/26/2015 03:50 AM, Yu-Chieh wrote:
>>
>> Hi,
>>
>> I am working on IBSS mode by using ath10k. However i met some problem
>> about the performance issue
>> First of all, i set up two nodes, A (74:DA:38:19:19:DC) and B
>> (74:DA:38:06:E1:96) and run iperf.
>> i can get around 170 Mbps form A to B
>>
>> Then, i turn on the third node C(74:DA:38:06:E1:BE).
>> The performance is deteriorated to around 30Mbps.
>> If i turn off node C, the performance go back to 170 Mbps.
>>
>> At the same environment and same devices, i jsut change the mac of B
>> to (74:DA:38:06:E1:B2)
>> Everything is good.
>> No matter node c is on or off, the performance always keep on 170Mbps.
>>
>> Anyone have any idea about this problem?
>>
>> Jay
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
