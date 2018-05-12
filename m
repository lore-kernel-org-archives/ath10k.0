Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHQXz-0003XM-2Z
 for ath10k@lists.infradead.org; Sat, 12 May 2018 09:10:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: hw: make consistent usage of ATH10K_FW_DIR in
 paths
References: <20180509075633.3030-1-marcus.folkesson@gmail.com>
Date: Sat, 12 May 2018 12:10:21 +0300
In-Reply-To: <20180509075633.3030-1-marcus.folkesson@gmail.com> (Marcus
 Folkesson's message of "Wed, 9 May 2018 09:56:33 +0200")
Message-ID: <87in7tutmq.fsf@kamboji.qca.qualcomm.com>
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
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

I don't like empty commit logs so I added this in the pending branch:

  ath10k: hw: make consistent usage of ATH10K_FW_DIR in paths

  For some reason not all entries used ATH10K_FW_DIR so fix that. No functional 
  changes.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
