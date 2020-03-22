Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFxkV-000244-NI
 for ath10k@lists.infradead.org; Sun, 22 Mar 2020 10:22:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Fill GCMP MIC length for PMF
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1584540911-4267-1-git-send-email-ssreeela@codeaurora.org>
References: <1584540911-4267-1-git-send-email-ssreeela@codeaurora.org>
Message-Id: <20200322102228.1A300C433BA@smtp.codeaurora.org>
Date: Sun, 22 Mar 2020 10:22:28 +0000 (UTC)
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
To: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Cc: Yingying Tang <yintang@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sowmiya Sree Elavalagan <ssreeela@codeaurora.org> wrote:

> GCMP MIC length is not filled for GCMP/GCMP-256 cipher suites in
> PMF enabled case. Due to mismatch in MIC length, deauth/disassoc frames
> are unencrypted.
> This patch fills proper MIC length for GCMP/GCMP-256 cipher suites.
> 
> Tested HW: QCA9984, QCA9888
> Tested FW: 10.4-3.6-00104
> 
> Signed-off-by: Yingying Tang <yintang@codeaurora.org>
> Co-developed-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
> Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

95a568c4a461 ath10k: Fill GCMP MIC length for PMF

-- 
https://patchwork.kernel.org/patch/11445331/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
