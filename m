Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRg00-0003Dw-RD
 for ath10k@lists.infradead.org; Wed, 10 Sep 2014 11:23:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: ATH10K_DEBUGFS depends on DEBUG_FS
References: <1409835069-2246-1-git-send-email-matteo@openwrt.org>
Date: Wed, 10 Sep 2014 14:23:17 +0300
In-Reply-To: <1409835069-2246-1-git-send-email-matteo@openwrt.org> (Matteo
 Croce's message of "Thu, 4 Sep 2014 14:51:09 +0200")
Message-ID: <87zje77m8q.fsf@kamboji.qca.qualcomm.com>
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
To: Matteo Croce <matteo@openwrt.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Matteo Croce <matteo@openwrt.org> writes:

> ATH10K_DEBUGFS must depend on DEBUG_FS, otherwise
> ath10k will generate an invalid pointer on module load
>
> Signed-off-by: Matteo Croce <matteo@openwrt.org>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
