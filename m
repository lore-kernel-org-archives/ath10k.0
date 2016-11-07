Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3orA-0005CA-IW
 for ath10k@lists.infradead.org; Mon, 07 Nov 2016 18:41:21 +0000
Received: by mail-qk0-x22a.google.com with SMTP id n21so77076248qka.3
 for <ath10k@lists.infradead.org>; Mon, 07 Nov 2016 10:40:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <871syn5fnb.fsf@qca.qualcomm.com>
References: <773DB8A82AB6A046AE0195C68612A31901C5B293@sbs2003.acksys.local>
 <566849DB.9040901@candelatech.com> <079401d132a6$7e7e2050$7b7a60f0$@acksys.fr>
 <CABUTiXWg3t5qK6O5ooDE+4=Xk3Msybs5mu9+tQm_Bb0wdSrfWQ@mail.gmail.com>
 <87twbnueqv.fsf@kamboji.qca.qualcomm.com>
 <CABUTiXW5QSh2KkD+sQ-6QOD5zTce0dun+nyfAMnvL580U=OVNw@mail.gmail.com>
 <871syn5fnb.fsf@qca.qualcomm.com>
From: Bruno Antunes <baantunes@gmail.com>
Date: Mon, 7 Nov 2016 18:40:37 +0000
Message-ID: <CABUTiXV8eFsW4MJET4spvjVQvFgi66NV7hLLxFC6Ttqs1znxjA@mail.gmail.com>
Subject: Re: [OpenWrt-Devel] ATH10K VLAN firmware issue
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, linux-wireless <linux-wireless@vger.kernel.org>, voncken <cedric.voncken@acksys.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 7 November 2016 at 18:06, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Bruno Antunes <baantunes@gmail.com> writes:
>
>> On 4 November 2016 at 21:17, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>>> Bruno Antunes <baantunes@gmail.com> writes:
>>>
>>>> Old thread but I think the issue is still present.
>>>>
>>>> I'm running a setup with VLANs with WDS and ath10k cards.
>>>>
>>>> To make it work both cards must be loaded in rawmode, AP
>>>> and Sta, and with no security.
>>>>
>>>> I'm using a OpenWrt trunk r49941 and the most recent firmware,
>>>> 10.2.4.70.58, from Kalle ath10k firmware tree.
>>>>
>>>> Although it works the throughput is very bad.
>>>> Are there any alternatives to improve the throughput.
>>>
>>> Can someone file a bug to bugzilla about this so that all the info is
>>> properly stored? The more comprehensive the report is the better.
>>>
>>> https://bugzilla.kernel.org/
>>
>> I will file a bug report.
>
> Thanks, it's good to store all in one place so that it's easier to find
> the relevant info.

Just file the bug with the ID 187241 -  VLAN support in ATH10k
Feel free to ask for adicional info.
I did not mention any names in the bug report fell free to take credit
if wanted.

Regards,
Bruno

>
>> But since it appears to be a firmware related issue
>> under what category can fill in the bug?
>
> You can file it under Drivers/network-wireless, AFAIK we don't have any
> separate components for firmware bugs. Here's one example to follow:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=186161
>
> --
> Kalle Valo
> _______________________________________________
> openwrt-devel mailing list
> openwrt-devel@lists.openwrt.org
> https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
