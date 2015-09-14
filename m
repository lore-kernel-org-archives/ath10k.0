Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbNlC-0002oc-Hl
 for ath10k@lists.infradead.org; Mon, 14 Sep 2015 07:01:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4.3] ath10k: fix DMA related firmware crashes on multiple
 devices
In-Reply-To: <1442176540-34973-1-git-send-email-nbd@openwrt.org> (Felix
 Fietkau's message of "Sun, 13 Sep 2015 22:35:40 +0200")
References: <1442176540-34973-1-git-send-email-nbd@openwrt.org>
Date: Mon, 14 Sep 2015 10:00:37 +0300
Message-ID: <87si6h1o4q.fsf@kamboji.qca.qualcomm.com>
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
To: Felix Fietkau <nbd@openwrt.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Felix Fietkau <nbd@openwrt.org> writes:

> Some platforms really don't like DMA bursts of 256 bytes, and this
> causes the firmware to crash when sending beacons.
> Also, changing this based on the firmware version does not seem to make
> much sense, so use 128 bytes for all versions.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Felix Fietkau <nbd@openwrt.org>

Nice, good catch! Just to make sure, this fixes the issues some people
have reported that 10.1 firmware works but 10.2 firmware crashes when
starting beaconing?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
