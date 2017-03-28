Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csvCH-0007kZ-Er
 for ath10k@lists.infradead.org; Tue, 28 Mar 2017 17:46:23 +0000
Received: by mail-it0-x22e.google.com with SMTP id y18so28816293itc.1
 for <ath10k@lists.infradead.org>; Tue, 28 Mar 2017 10:46:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAf+CsCzy=v6v5p2NrzpWbbRKbvcF+TxWT6YF3xO0TVgcQWrrw@mail.gmail.com>
References: <CAAf+CsCYmJMvMfq+UEmE_FDin8i2QS8-sbVyypew8vcmuZfBkg@mail.gmail.com>
 <43883e2c701b437e9785b89faaaf848b@NALASEXR01G.na.qualcomm.com>
 <CAAf+CsDc+kFn+Tn3cH4su0AFr9arHCXE9bdRtNxQBaRL3XxzAg@mail.gmail.com>
 <CAAf+CsCo2RVrBfP5LH9k3_F3W60BQOGODExwcKDrgj2Jq=MjWQ@mail.gmail.com>
 <CAAf+CsD0bvwaB2pLLActv9XCimdNaWAjoS2ZU4WN1d-kt3rSDA@mail.gmail.com>
 <1490309165963.76201@qca.qualcomm.com>
 <CAAf+CsCzy=v6v5p2NrzpWbbRKbvcF+TxWT6YF3xO0TVgcQWrrw@mail.gmail.com>
From: =?UTF-8?Q?Guilherme_=C3=8Dscaro?= <cabelitostos@gmail.com>
Date: Tue, 28 Mar 2017 14:45:59 -0300
Message-ID: <CAAf+CsCKx3p=TdWZxbSi9JRfKUicCqyAUaP-Kzxgj1N6XK0WqQ@mail.gmail.com>
Subject: Re: Reporting a bug for QCA6174 802.11ac
Content-Type: multipart/mixed; boundary=001a113ec7b669af6b054bce0804
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--001a113ec7b669af6b054bce0804
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I would like to inform that I "fixed" the problem. After my last
email, I cloned the linux repo and started to hack around the driver
source code. By looking at the dmesg output that I provided to you
guys, I noticed that for some reason the board was not being properly
awake ( ath10k_pci_wake_wait() returns ETIMEOUT). I so sick with this
problem that I hardcoded "ar_pci->pci_ps" to false, thus the board
can't sleep now.

Please, send some thoughts.

I attached the patch so you guys can take a look.

Thanks.

2017-03-23 20:11 GMT-03:00 Guilherme =C3=8Dscaro <cabelitostos@gmail.com>:
> Hello Ryan, thanks for your contact.
>
> My AP is a D-link DMG 6661. I'll try another wifi settings and check
> if it happens and if it happens I'll provide de ftrace logs.
>
> Btw, just after I read your email the bug happened. Here's the full
> dmesg. After the "failed to wake target" problem happens it keeps
> flooding dmesg forever. There are no other error indications.
>
> I guess that the dmesg output will not help us, maybe ftrace will be
> more helpful. Anyway, here's the dmesg...
>
> Thanks for your help
>
> 2017-03-23 19:46 GMT-03:00 Ryan Hsu <ryanhsu@qca.qualcomm.com>:
>> Let's start from the basic, could you provide the ftrace logs and also t=
he AP model you're using? try without security or different phy mode to see=
 if it would behave differently?
>>
>> The last thing is, your previous logs only stuffed with the register acc=
ess failure logs, can you share a full dmesg logs as well?
>>
>> Ryan
>> ________________________________________
>> From: Guilherme =C3=8Dscaro <cabelitostos@gmail.com>
>> Sent: Wednesday, March 22, 2017 3:17 PM
>> To: Ryan Hsu
>> Cc: ath10k@lists.infradead.org
>> Subject: Re: Reporting a bug for QCA6174 802.11ac
>>
>> Hi, unfortunately the problem happened with the new drivers and firmware=
. :[
>> I really don't know what to do anymore.....
>>
>> thanks.
>>
>> 2017-03-22 10:56 GMT-03:00 Guilherme =C3=8Dscaro <cabelitostos@gmail.com=
>:
>>> I've installed the new firmware/driver. I'll send a new email in some
>>> days to tell you guys if the new driver/firmware resolved the problem.
>>>
>>> Thanks for the help.
>>>
>>> 2017-03-21 15:58 GMT-03:00 Guilherme =C3=8Dscaro <cabelitostos@gmail.co=
m>:
>>>> Hello Ryan, Thanks for your response.
>>>>
>>>> My AP is in the same room that I use my notebook, it's right in front
>>>> of me. There's no specific scenario for this failure to happen.
>>>> Sometimes it does not happens for days, but sometimes it happens 3/4
>>>> times in the same day.
>>>> It looks like that there is not specific scenario, sometimes it
>>>> happens while I'm using firefox, sometimes it happens when my laptop
>>>> is "doing nothing". (Was it helpful?)
>>>>
>>>> I'm using WiFi 802.11n, 2.4ghz with AES.
>>>>
>>>> I'll try this new firmware/driver.
>>>>
>>>> Thanks.
>>>>
>>>>
>>>>
>>>> 2017-03-21 15:35 GMT-03:00 Ryan Hsu <ryanhsu@qca.qualcomm.com>:
>>>>> Iscaro,
>>>>>
>>>>> Not sure how exactly the issue and scenario of your usage.
>>>>>
>>>>> e.g how far the AP from you and is there any specific scenario you're=
 seeing the failure open?
>>>>>
>>>>> Also would you mind try to pick up the latest firmware to see if that=
 help?
>>>>> https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.=
4
>>>>>
>>>>> With the latest firmware, you might also need to get the latest drive=
r backport package.
>>>>> http://buildbot.w1.fi/backports-wireless-testing/
>>>>>
>>>>> Ryan
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf O=
f
>>>>>> Guilherme =C3=8Dscaro
>>>>>> Sent: Monday, March 20, 2017 08:32 AM
>>>>>> To: ath10k@lists.infradead.org
>>>>>> Subject: Reporting a bug for QCA6174 802.11ac
>>>>>>
>>>>>> Hello everyone, I would like to report a bug for QCA6174.
>>>>>>
>>>>>> I use WiFi everyday, but from time to time I lose my connection. Thi=
s might be
>>>>>> related to a firmware problem, because after I lose my connection th=
e firmware
>>>>>> keeps flooding dmesg about problems.
>>>>>>
>>>>>> I have this problem since I  bought my laptop (which was last year) =
and I do
>>>>>> regular updates in my system.
>>>>>>
>>>>>> P.S: dmest output attached.
>>>>>>
>>>>>> My system:
>>>>>>
>>>>>> Dist: Arch Linux.
>>>>>> Kernel: 4.10.3-1
>>>>>> Linux-firmware version: 20170309.695f2d6-1 (commit 695f2d6d82173f4e.=
..
>>>>>> from linux-firmware)
>>>>>> Board: 02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac
>>>>>> Wireless Network Adapter (rev 32)
>>>>>>
>>>>>>
>>>>>> Please, let me know if I should provide more info.
>>>>>>
>>>>>> Thanks.

--001a113ec7b669af6b054bce0804
Content-Type: text/x-patch; charset=US-ASCII; name="0001-FIX-BUG.patch"
Content-Disposition: attachment; filename="0001-FIX-BUG.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j0tu1fhn1

RnJvbSBjM2JjM2U1Mjk5OGQ4YjYxODlkYTAwMzkxNTcwMzU5ZTE3ZDFkMzU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHdWlsaGVybWUgSXNjYXJvIDxpc2Nhcm9AcHJvZnVzaW9uLm1v
Ymk+CkRhdGU6IFR1ZSwgMjEgTWFyIDIwMTcgMTA6MDU6NDAgLTAzMDAKU3ViamVjdDogW1BBVENI
XSBGSVggQlVHLgoKLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3BjaS5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYyBiL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMKaW5kZXggYjU0MWExYzc0NDg4Li4wZGE0NzBi
MGFlZTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMK
KysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYwpAQCAtMzE4Nyw3ICsz
MTg3LDcgQEAgc3RhdGljIGludCBhdGgxMGtfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
LAogCWNhc2UgUUNBNjE2NF8yXzFfREVWSUNFX0lEOgogCWNhc2UgUUNBNjE3NF8yXzFfREVWSUNF
X0lEOgogCQlod19yZXYgPSBBVEgxMEtfSFdfUUNBNjE3NDsKLQkJcGNpX3BzID0gdHJ1ZTsKKwkJ
cGNpX3BzID0gZmFsc2U7CiAJCXBjaV9zb2Z0X3Jlc2V0ID0gYXRoMTBrX3BjaV93YXJtX3Jlc2V0
OwogCQlwY2lfaGFyZF9yZXNldCA9IGF0aDEwa19wY2lfcWNhNjE3NF9jaGlwX3Jlc2V0OwogCQli
cmVhazsKLS0gCjIuMTIuMQoK
--001a113ec7b669af6b054bce0804
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--001a113ec7b669af6b054bce0804--
