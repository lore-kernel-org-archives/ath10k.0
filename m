Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihHh6-0001lc-8X
 for ath10k@lists.infradead.org; Tue, 17 Dec 2019 18:35:43 +0000
Received: by mail-qt1-f196.google.com with SMTP id b3so9477272qti.10
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2019 10:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20191216220747.887-1-greearb@candelatech.com>
 <a2af03e9-8b53-b297-467b-d0f07b8a002b@newmedia-net.de>
 <b5d63d96-4ba6-bbab-bf1c-a61c6c437f37@newmedia-net.de>
 <80700614-679a-336e-bd9a-e88622e75c9a@candelatech.com>
 <4775d91a-9719-46f8-b0f2-979b8d86cf9f@newmedia-net.de>
 <CAMrEMU-vGB8uR-JZbD2vj4vXgWNHfFqcbsqB=gOqBBDZWGkzQA@mail.gmail.com>
 <11290a30-46e8-638e-4110-86e6b2eb3d3f@candelatech.com>
 <CAKR_QV+xNbAzzw12x3Ku49bHnERTxYRAK8AfUSwp_uOgNMbY4Q@mail.gmail.com>
In-Reply-To: <CAKR_QV+xNbAzzw12x3Ku49bHnERTxYRAK8AfUSwp_uOgNMbY4Q@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 17 Dec 2019 10:35:23 -0800
Message-ID: <CAJ-Vmon5811ktT-+8HcMOAPnOLGzd20rFMxaTucXbEEAz4+q0A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Per-chain rssi should sum the secondary channels
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
To: Tom Psyborg <pozega.tomislav@gmail.com>
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>, Justin Capella <justincapella@gmail.com>

On Tue, 17 Dec 2019 at 10:29, Tom Psyborg <pozega.tomislav@gmail.com> wrote:
>
> On 17/12/2019, Ben Greear <greearb@candelatech.com> wrote:
> > On 12/17/19 8:23 AM, Justin Capella wrote:
> >> I believe someone recently submitted a patch that defined noise floors
> >> per band (2/5).
> >
> > I looked at using the real noise floor.  Our radio was reporting a noise
> > floor of around -102,
> > where the hard-coded default is -95.  This of course would make the reported
> > RSSI lower by 7db
> > in that case.  I am not sure that is correct.
> >
>
> Hi
>
> I am getting similar NF values with all my ath10k devices, I thought
> default was changed since ath9k from -95 to -115 just like in the
> vendor driver? There were some discussions about it on mailing list.
> On some channels (5Ghz) the value goes down to about -107, even saw
> -110 once.

IIRC they're /not/ calibrated dBm values. They're just internal noise
floor calibration values derived from the internal ADC reads when you
kick off a NF cal. Then everything is relative to this NF value.

This is one of the many, many reasons things get gunked up when you
start seeing higher noise floor values; since a lot of things
internally are/were related to what the currently calibrated NF value
is, a too-high NF sample value would result in quite exciting things
in the PHY like "this channel never drops below CCA"...




-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
