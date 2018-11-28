Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS30M-0004Fl-Qy
 for ath10k@lists.infradead.org; Wed, 28 Nov 2018 16:48:04 +0000
Message-Id: <1543423670.3738383.1592013184.03C61964@webmail.messagingengine.com>
From: Anil Duggirala <anilduggirala@fastmail.fm>
MIME-Version: 1.0
Subject: Re: missing firmware in debian 9
In-Reply-To: <87d0qp6xl0.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 28 Nov 2018 11:47:50 -0500
References: <20181116133851.czjhgfmttodnudzg@adell35>
 <6892054.LxBMB1ZCDT@bentobox>
 <87h8g170zl.fsf@kamboji.qca.qualcomm.com>
 <1543415108.3687532.1591824912.00271098@webmail.messagingengine.com>
 <87d0qp6xl0.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: debian-kernel@lists.debian.org, ath10k@lists.infradead.org, Sven Eckelmann <sven.eckelmann@openmesh.com>

> > How can I make sure this is the case?
> 
> ath10k prints lots of information to dmesg after it has initialised the
> device, so check that. You should see the firmware version and what api
> is used (the number N from firmware-N.bin).

Ok, I have checked and it is:
[    9.883661] ath10k_pci 0000:03:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-4.bin

thank you Kalle and Sven,

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
