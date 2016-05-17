Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2Zfi-0006PH-Tw
 for ath10k@lists.infradead.org; Tue, 17 May 2016 07:44:07 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Setting per-frame tx rate for frames injected in raw tx mode
Date: Tue, 17 May 2016 07:43:41 +0000
Message-ID: <87mvnp6ser.fsf@kamboji.qca.qualcomm.com>
References: <CA+uUJGtXNAe=FRgYTVDNf6aNVE78CMSs+gLj-bQgA_=hFZibaA@mail.gmail.com>
 <57320C1A.3040604@candelatech.com>
 <CA+uUJGukss2Z7i=k0OvERWvkzMGwBFTaY6R_TL5sGo4yXKQFsA@mail.gmail.com>
 <57335A43.4050902@candelatech.com>
 <CA+uUJGsVi0OiwK4D6n-ANXRm6ptiTdjvKNboXobwn4FA0YfsRQ@mail.gmail.com>
 <573892F5.40706@candelatech.com> <5738AE96.8040800@candelatech.com>
 <CA+uUJGuMrDoXat3rD2AeHTLZUCUDPHXhHVy==62mGLN01O8Vdw@mail.gmail.com>
In-Reply-To: <CA+uUJGuMrDoXat3rD2AeHTLZUCUDPHXhHVy==62mGLN01O8Vdw@mail.gmail.com>	(Raj
 Joshi's message of "Tue, 17 May 2016 14:14:43 +0700")
Content-Language: en-US
Content-ID: <8C7BD1131EEDBB43A1A489280AB81595@qualcomm.com>
MIME-Version: 1.0
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
To: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Raj Joshi <rajjoshi@comp.nus.edu.sg> writes:

> But I believe there should be some way of fixing rate settings from
> upper layers of the pipeline. iw lets us do manual bitrate
> configuration [2] for ath10k which works as expected. But this only
> helps in setting of rate per-session. I am still finding answers to
> the following questions:
> 1) What is it that iw does that it manages to get the manual bitrate
> configuration?
> 2) How does it ask the firmware to not do any RA and always honor the
> set rate? Basically how does it override the default RA?

The firmware has separate WMI vdev parameters for setting a fixed rate,
check ath10k_mac_op_set_bitrate_mask() for more info.

> 3) Can we do the same on a per-packet basis?

The firmware currently doesn't support that.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
