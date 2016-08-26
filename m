Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdBy3-0006s7-Hx
 for ath10k@lists.infradead.org; Fri, 26 Aug 2016 07:54:24 +0000
Received: by mail-qk0-x236.google.com with SMTP id t7so69189825qkh.1
 for <ath10k@lists.infradead.org>; Fri, 26 Aug 2016 00:54:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BY2PR20MB02482310935BD9E77D52C564DFEC0@BY2PR20MB0248.namprd20.prod.outlook.com>
References: <20160816035841.M15556@universe.cdotb.ernet.in>
 <6fe9261b-c662-3b89-b78b-d492e013648a@gentrice.net>
 <20160816044306.M74655@cdot.in>
 <8ec31d40-4a01-ed24-ed2e-3be351aab5d5@gentrice.net>
 <20160816091707.M1726@cdot.in>
 <1471374073.3432.8.camel@qca.qualcomm.com>
 <09b6c230448b4e8b80a47f09c8f5a7ccf0f4fe819eb74a49b049076a3f10086020984c91a40b481a97dc2a26d81e6b3fBY2PR20MB0248FA35E3C1CF41FEF78CEBDFE80@BY2PR20MB0248.namprd20.prod.outlook.com>
 <CAAnMG+M4f38bvPEhPSeS-JfwJziy-J2N==B=o5YZxQm4T54kYQ@mail.gmail.com>
 <BY2PR20MB02482310935BD9E77D52C564DFEC0@BY2PR20MB0248.namprd20.prod.outlook.com>
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Date: Fri, 26 Aug 2016 15:54:01 +0800
Message-ID: <CAEFj986zGSmmi-93oDZAt-Y+q=9POGvss7=nz-P0gATAcTMKQQ@mail.gmail.com>
Subject: Re: Issue with ATH10K driver while bringing up mesh interface
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
To: Peter Oh <ebmajor@live.com>
Cc: "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Alexis Green <agreen@cococorp.com>, Horse <horse@gentrice.net>, "Pedersen,
 Thomas" <twp@qca.qualcomm.com>, Raj Joshi <rajjoshi@comp.nus.edu.sg>, Sridhar Konabathini <sridhark@cdot.in>

Hi, Peter Oh

We are still required to load ath10k driver with rawmode=1 for mesh mode.

If the upcoming FW version (10.2.4.70.12-2) won't required this and
also to achieve better throughput, I think that we should remove the
lines of code that forces the raw mode requirement for mesh interface.

---
Chun-Yeow

On Fri, Aug 26, 2016 at 1:41 PM, Peter Oh <ebmajor@live.com> wrote:
> I was talking about QCA988X firmware and I don't think QCA99X0 has officially released firmware for mesh.
>
> Thanks,
> Peter
>
> From: Alexis Green <agreen@cococorp.com>
> Sent: Monday, August 22, 2016 10:33 AM
> To: Peter Oh
> Cc: Pedersen, Thomas; Sridhar Konabathini; michal.kazior@tieto.com; Raj Joshi; ath10k@lists.infradead.org; Horse
> Subject: Re: Issue with ATH10K driver while bringing up mesh interface
>
> Speaking of rawmode and updated firmware, are QCA99X0 devices SOL as
> far as mesh support goes? 10.4.1.00030-1 is the latest firmware I can
> find for this hardware and it doesn't support neither raw mode, nor
> native 80211s.
>
> Best regards,
> Alexis
>
> On Mon, Aug 22, 2016 at 9:42 AM, Peter Oh <ebmajor@live.com> wrote:
>> re-send in plain text mode.
>>> >
>>
>>
>>
>>> > Please try  "insmod ath10k_core.ko rawmode=1"
>>> >
>> I recommend you to use  FW version 10.2.4.70.12-2 or higher, so that you don't have to use raw mode. Main downside using raw mode is throughput throttled.
>> You can get the ath10k firmware from  https://github.com/kvalo/ath10k-firmware.
>
>
>
> GitHub - kvalo/ath10k-firmware: Firmware files for ath10k ...
> github.com
> README.md ath10k-firmware. These are the latest firmware files for ath10k, a mac80211 driver for QCA988x, QCA6174, QCA99XX and similar. The official location to ...
>
>>
>>
>> Peter
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
