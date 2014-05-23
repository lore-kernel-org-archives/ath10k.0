Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wnkt9-0007Au-0f
 for ath10k@lists.infradead.org; Fri, 23 May 2014 08:31:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix ath10k_bmi_read32 macro
References: <1400249601-24899-1-git-send-email-frederic.danis@linux.intel.com>
Date: Fri, 23 May 2014 11:31:12 +0300
In-Reply-To: <1400249601-24899-1-git-send-email-frederic.danis@linux.intel.com>
 (Frederic Danis's message of "Fri, 16 May 2014 16:13:21 +0200")
Message-ID: <87k39cvqum.fsf@kamboji.qca.qualcomm.com>
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
To: Frederic Danis <frederic.danis@linux.intel.com>
Cc: linux-wireless@vger.kernel.org, linville@tuxdriver.com, ath10k@lists.infradead.org

Frederic Danis <frederic.danis@linux.intel.com> writes:

> tmp may be used uninitialized if ath10k_bmi_read_memory() returns
> an error.
>
> Signed-off-by: Frederic Danis <frederic.danis@linux.intel.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
