Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buzWC-0002eS-Rw
 for ath10k@lists.infradead.org; Fri, 14 Oct 2016 10:15:13 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] QCA9984 VHT160 support
Date: Fri, 14 Oct 2016 10:14:45 +0000
Message-ID: <87vawv9qzv.fsf@kamboji.qca.qualcomm.com>
References: <CA+uUJGtXNAe=FRgYTVDNf6aNVE78CMSs+gLj-bQgA_=hFZibaA@mail.gmail.com>
 <57320C1A.3040604@candelatech.com>
 <CA+uUJGukss2Z7i=k0OvERWvkzMGwBFTaY6R_TL5sGo4yXKQFsA@mail.gmail.com>
 <57335A43.4050902@candelatech.com>
 <CA+uUJGsVi0OiwK4D6n-ANXRm6ptiTdjvKNboXobwn4FA0YfsRQ@mail.gmail.com>
 <573892F5.40706@candelatech.com> <5738AE96.8040800@candelatech.com>
 <CA+uUJGuMrDoXat3rD2AeHTLZUCUDPHXhHVy==62mGLN01O8Vdw@mail.gmail.com>
 <87mvnp6ser.fsf@kamboji.qca.qualcomm.com>
 <572a14ee-d1b5-7b85-d292-51f583f34f17@dd-wrt.com>
 <87lgyug42q.fsf@kamboji.qca.qualcomm.com>
 <bd2ae01e-6cf5-837e-5573-1d62bbfdbe1b@dd-wrt.com>
 <8737l2ee1y.fsf@kamboji.qca.qualcomm.com>
 <5c915231-db74-a147-f904-21c09d8a1ff0@dd-wrt.com>
In-Reply-To: <5c915231-db74-a147-f904-21c09d8a1ff0@dd-wrt.com> (Sebastian
 Gottschall's message of "Fri, 16 Sep 2016 09:51:31 +0200")
Content-Language: en-US
Content-ID: <DED46D287E02B542A01CFC0776FB526E@qualcomm.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> This patch adds full VHT160 support for QCA9984 chipsets
> Tested on Netgear R7800. 80+80 is possible, but disabled so far since
> it seems to contain glitches like missing vht station flags (this may
> be firmware or mac80211 related)

So how did you disable 80+80 exactly? I can't find it and I would like
to add a comment to the code so that it's easy to enable it later (once
it's working).

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
