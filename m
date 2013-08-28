Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEYsq-0008IT-Te
 for ath10k@lists.infradead.org; Wed, 28 Aug 2013 06:05:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: What chipsets does ath10k cover?
References: <CANMvdA-GhFH3TE6YU1745cOnM_1jJpi_2Sh7phpWWLWUXB_Pjw@mail.gmail.com>
Date: Wed, 28 Aug 2013 09:05:07 +0300
In-Reply-To: <CANMvdA-GhFH3TE6YU1745cOnM_1jJpi_2Sh7phpWWLWUXB_Pjw@mail.gmail.com>
 (Francisco Cuesta's message of "Wed, 21 Aug 2013 20:11:14 +0200")
Message-ID: <877gf6jqp8.fsf@kamboji.qca.qualcomm.com>
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
To: Francisco Cuesta <ndarkness@gmail.com>
Cc: ath10k@lists.infradead.org

Francisco Cuesta <ndarkness@gmail.com> writes:

>  I've started to use a new version of compat-wireless,of 2013-06-27,
> and I can see that includes the new atheros10k driver. Thus, I was
> wondering the chipsets that it embraces, is it just ment for QCA988x
> family of chips?

Yes, currently it supports only QCA9880 and other chips based on the
same design. But ath10k doesn not support QCA9880 v1, only v2 boards.

> Or can it embrace Atheros AR9580 5GHz 802.11an 3x3 MIMO for 5GHz
> 802.11a/n/ac as well?

AFAIK AR9580 is a 802.11n design and should be supported by ath9k.
ath10k does not support it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
