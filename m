Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UxDKX-00033F-Jg
 for ath10k@lists.infradead.org; Thu, 11 Jul 2013 09:38:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [ath9k-devel] [PATCH] ath10k: Fix crash when using v1 hardware.
References: <1372804925-1701-1-git-send-email-greearb@candelatech.com>
 <51D35D58.5090507@candelatech.com>
Date: Thu, 11 Jul 2013 12:37:55 +0300
In-Reply-To: <51D35D58.5090507@candelatech.com> (Ben Greear's message of "Tue, 
 02 Jul 2013 16:08:08 -0700")
Message-ID: <87txk15te4.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> Actually, I have no idea what type of hardware this is.  It was
> suggested earlier to me that this AP had a v1 hardware in it, but
> lspci shows this fairly unpromising thing, and the ath10k driver
> appears to call 003c the V2 hardware....
>
> 05:00.0 Network controller: Atheros Communications Inc. Device 003c (rev ff) (prog-if ff)
> 	!!! Unknown header type 7f
> 	Kernel modules: ath10k_pci

That unknown header type looks scary. I'm starting to suspect even more
that you have a hw problem of some sort.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
