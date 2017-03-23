Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1crBV6-0001hL-MB
 for ath10k@lists.infradead.org; Thu, 23 Mar 2017 22:46:39 +0000
From: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Subject: Re: Reporting a bug for QCA6174 802.11ac
Date: Thu, 23 Mar 2017 22:46:03 +0000
Message-ID: <1490309165963.76201@qca.qualcomm.com>
References: <CAAf+CsCYmJMvMfq+UEmE_FDin8i2QS8-sbVyypew8vcmuZfBkg@mail.gmail.com>
 <43883e2c701b437e9785b89faaaf848b@NALASEXR01G.na.qualcomm.com>
 <CAAf+CsDc+kFn+Tn3cH4su0AFr9arHCXE9bdRtNxQBaRL3XxzAg@mail.gmail.com>
 <CAAf+CsCo2RVrBfP5LH9k3_F3W60BQOGODExwcKDrgj2Jq=MjWQ@mail.gmail.com>,
 <CAAf+CsD0bvwaB2pLLActv9XCimdNaWAjoS2ZU4WN1d-kt3rSDA@mail.gmail.com>
In-Reply-To: <CAAf+CsD0bvwaB2pLLActv9XCimdNaWAjoS2ZU4WN1d-kt3rSDA@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?iso-8859-1?Q?Guilherme_=CDscaro?= <cabelitostos@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Let's start from the basic, could you provide the ftrace logs and also the =
AP model you're using? try without security or different phy mode to see if=
 it would behave differently?

The last thing is, your previous logs only stuffed with the register access=
 failure logs, can you share a full dmesg logs as well?

Ryan
________________________________________
From: Guilherme =CDscaro <cabelitostos@gmail.com>
Sent: Wednesday, March 22, 2017 3:17 PM
To: Ryan Hsu
Cc: ath10k@lists.infradead.org
Subject: Re: Reporting a bug for QCA6174 802.11ac

Hi, unfortunately the problem happened with the new drivers and firmware. :[
I really don't know what to do anymore.....

thanks.

2017-03-22 10:56 GMT-03:00 Guilherme =CDscaro <cabelitostos@gmail.com>:
> I've installed the new firmware/driver. I'll send a new email in some
> days to tell you guys if the new driver/firmware resolved the problem.
>
> Thanks for the help.
>
> 2017-03-21 15:58 GMT-03:00 Guilherme =CDscaro <cabelitostos@gmail.com>:
>> Hello Ryan, Thanks for your response.
>>
>> My AP is in the same room that I use my notebook, it's right in front
>> of me. There's no specific scenario for this failure to happen.
>> Sometimes it does not happens for days, but sometimes it happens 3/4
>> times in the same day.
>> It looks like that there is not specific scenario, sometimes it
>> happens while I'm using firefox, sometimes it happens when my laptop
>> is "doing nothing". (Was it helpful?)
>>
>> I'm using WiFi 802.11n, 2.4ghz with AES.
>>
>> I'll try this new firmware/driver.
>>
>> Thanks.
>>
>>
>>
>> 2017-03-21 15:35 GMT-03:00 Ryan Hsu <ryanhsu@qca.qualcomm.com>:
>>> Iscaro,
>>>
>>> Not sure how exactly the issue and scenario of your usage.
>>>
>>> e.g how far the AP from you and is there any specific scenario you're s=
eeing the failure open?
>>>
>>> Also would you mind try to pick up the latest firmware to see if that h=
elp?
>>> https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4
>>>
>>> With the latest firmware, you might also need to get the latest driver =
backport package.
>>> http://buildbot.w1.fi/backports-wireless-testing/
>>>
>>> Ryan
>>>
>>>> -----Original Message-----
>>>> From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of
>>>> Guilherme =CDscaro
>>>> Sent: Monday, March 20, 2017 08:32 AM
>>>> To: ath10k@lists.infradead.org
>>>> Subject: Reporting a bug for QCA6174 802.11ac
>>>>
>>>> Hello everyone, I would like to report a bug for QCA6174.
>>>>
>>>> I use WiFi everyday, but from time to time I lose my connection. This =
might be
>>>> related to a firmware problem, because after I lose my connection the =
firmware
>>>> keeps flooding dmesg about problems.
>>>>
>>>> I have this problem since I  bought my laptop (which was last year) an=
d I do
>>>> regular updates in my system.
>>>>
>>>> P.S: dmest output attached.
>>>>
>>>> My system:
>>>>
>>>> Dist: Arch Linux.
>>>> Kernel: 4.10.3-1
>>>> Linux-firmware version: 20170309.695f2d6-1 (commit 695f2d6d82173f4e...
>>>> from linux-firmware)
>>>> Board: 02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac
>>>> Wireless Network Adapter (rev 32)
>>>>
>>>>
>>>> Please, let me know if I should provide more info.
>>>>
>>>> Thanks.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
