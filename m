Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3icR-00008f-Aw
 for ath10k@lists.infradead.org; Mon, 07 Nov 2016 12:01:43 +0000
Received: by mail-qt0-x22d.google.com with SMTP id w33so85241468qtc.3
 for <ath10k@lists.infradead.org>; Mon, 07 Nov 2016 04:01:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87twbnueqv.fsf@kamboji.qca.qualcomm.com>
References: <773DB8A82AB6A046AE0195C68612A31901C5B293@sbs2003.acksys.local>
 <566849DB.9040901@candelatech.com> <079401d132a6$7e7e2050$7b7a60f0$@acksys.fr>
 <CABUTiXWg3t5qK6O5ooDE+4=Xk3Msybs5mu9+tQm_Bb0wdSrfWQ@mail.gmail.com>
 <87twbnueqv.fsf@kamboji.qca.qualcomm.com>
From: Bruno Antunes <baantunes@gmail.com>
Date: Mon, 7 Nov 2016 12:01:01 +0000
Message-ID: <CABUTiXW5QSh2KkD+sQ-6QOD5zTce0dun+nyfAMnvL580U=OVNw@mail.gmail.com>
Subject: Re: ATH10K VLAN firmware issue
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
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, voncken <cedric.voncken@acksys.fr>

On 4 November 2016 at 21:17, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Bruno Antunes <baantunes@gmail.com> writes:
>
>> Old thread but I think the issue is still present.
>>
>> I'm running a setup with VLANs with WDS and ath10k cards.
>>
>> To make it work both cards must be loaded in rawmode, AP
>> and Sta, and with no security.
>>
>> I'm using a OpenWrt trunk r49941 and the most recent firmware,
>> 10.2.4.70.58, from Kalle ath10k firmware tree.
>>
>> Although it works the throughput is very bad.
>> Are there any alternatives to improve the throughput.
>
> Can someone file a bug to bugzilla about this so that all the info is
> properly stored? The more comprehensive the report is the better.
>
> https://bugzilla.kernel.org/

I will file a bug report.

But since it appears to be a firmware related issue
under what category can fill in the bug?

Thanks,
Bruno

>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
