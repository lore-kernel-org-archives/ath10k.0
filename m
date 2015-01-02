Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6zfj-0003TI-MG
 for ath10k@lists.infradead.org; Fri, 02 Jan 2015 10:41:36 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21670.30281.688316.623369@gargle.gargle.HOWL>
Date: Fri, 2 Jan 2015 16:13:21 +0530
Subject: Re: [PATCH] ath10k: Enable RX batching
In-Reply-To: <87bnmh5zyh.fsf@kamboji.qca.qualcomm.com>
References: <1419834084-11859-1-git-send-email-sujith@msujith.org>
 <87fvbt62x9.fsf@kamboji.qca.qualcomm.com>
 <21670.22986.926659.849716@gargle.gargle.HOWL>
 <87bnmh5zyh.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo wrote:
> > Along with the other patch and an internal fix,
> > UDP RX increased to about 950 Mbps.
> 
> What was the number before?

It was about 600 Mbps. Maybe slightly higher, but the CPU
was maxed out by the torrent of tasklets trying to
replenish HTT buffers.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
