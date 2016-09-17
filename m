Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bl90O-0003aj-ES
 for ath10k@lists.infradead.org; Sat, 17 Sep 2016 06:21:41 +0000
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
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <d2a65c6c-d1f9-8c1e-f4b0-14c1115156e6@dd-wrt.com>
Date: Sat, 17 Sep 2016 08:21:18 +0200
MIME-Version: 1.0
In-Reply-To: <5c915231-db74-a147-f904-21c09d8a1ff0@dd-wrt.com>
Subject: unusual event
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

unusual event

latest ath10k version brings up the following issue on qca9984


[70300.488428] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70300.693091] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70300.897865] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70301.102779] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70301.307574] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70301.512389] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70301.717181] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70301.921989] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70302.126803] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70302.331583] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
root@apreithalle:~#  0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70295.368301] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70295.573106] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70295.777898] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70295.982745] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70296.187537] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70296.392354] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70296.597152] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode
[70296.801958] ath10k_pci 0000:01:00.0: received unexpected tx_fetch_ind =

event: in push mode

>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
