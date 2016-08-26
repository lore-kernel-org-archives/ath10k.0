Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from col004-omc2s17.hotmail.com ([65.55.34.91])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bd9ty-0002du-1o
 for ath10k@lists.infradead.org; Fri, 26 Aug 2016 05:42:03 +0000
From: Peter Oh <ebmajor@live.com>
Subject: Re: Issue with ATH10K driver while bringing up mesh interface
Date: Fri, 26 Aug 2016 05:41:38 +0000
Message-ID: <BY2PR20MB02482310935BD9E77D52C564DFEC0@BY2PR20MB0248.namprd20.prod.outlook.com>
References: <20160816035841.M15556@universe.cdotb.ernet.in>
 <6fe9261b-c662-3b89-b78b-d492e013648a@gentrice.net>
 <20160816044306.M74655@cdot.in>
 <8ec31d40-4a01-ed24-ed2e-3be351aab5d5@gentrice.net>
 <20160816091707.M1726@cdot.in> <1471374073.3432.8.camel@qca.qualcomm.com>
 <09b6c230448b4e8b80a47f09c8f5a7ccf0f4fe819eb74a49b049076a3f10086020984c91a40b481a97dc2a26d81e6b3fBY2PR20MB0248FA35E3C1CF41FEF78CEBDFE80@BY2PR20MB0248.namprd20.prod.outlook.com>,
 <CAAnMG+M4f38bvPEhPSeS-JfwJziy-J2N==B=o5YZxQm4T54kYQ@mail.gmail.com>
In-Reply-To: <CAAnMG+M4f38bvPEhPSeS-JfwJziy-J2N==B=o5YZxQm4T54kYQ@mail.gmail.com>
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
To: Alexis Green <agreen@cococorp.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Horse <horse@gentrice.net>, "Pedersen, Thomas" <twp@qca.qualcomm.com>, Sridhar Konabathini <sridhark@cdot.in>, Raj Joshi <rajjoshi@comp.nus.edu.sg>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>

I was talking about QCA988X firmware and I don't think QCA99X0 has official=
ly released firmware for mesh.

Thanks,
Peter

From: Alexis Green <agreen@cococorp.com>
Sent: Monday, August 22, 2016 10:33 AM
To: Peter Oh
Cc: Pedersen, Thomas; Sridhar Konabathini; michal.kazior@tieto.com; Raj Jos=
hi; ath10k@lists.infradead.org; Horse
Subject: Re: Issue with ATH10K driver while bringing up mesh interface
=A0   =

Speaking of rawmode and updated firmware, are QCA99X0 devices SOL as
far as mesh support goes? 10.4.1.00030-1 is the latest firmware I can
find for this hardware and it doesn't support neither raw mode, nor
native 80211s.

Best regards,
Alexis

On Mon, Aug 22, 2016 at 9:42 AM, Peter Oh <ebmajor@live.com> wrote:
> re-send in plain text mode.
>> >
>
>
>
>> > Please try=A0 "insmod ath10k_core.ko rawmode=3D1"
>> >
> I recommend you to use=A0 FW version 10.2.4.70.12-2 or higher, so that yo=
u don't have to use raw mode. Main downside using raw mode is throughput th=
rottled.
> You can get the ath10k firmware from  https://github.com/kvalo/ath10k-fir=
mware.



GitHub - kvalo/ath10k-firmware: Firmware files for ath10k ...
github.com
README.md ath10k-firmware. These are the latest firmware files for ath10k, =
a mac80211 driver for QCA988x, QCA6174, QCA99XX and similar. The official l=
ocation to ...

>
>
> Peter
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
    =

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
