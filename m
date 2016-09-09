Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biKej-0006Nu-F0
 for ath10k@lists.infradead.org; Fri, 09 Sep 2016 12:12:39 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix reporting channel survey data
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1472794193-20774-1-git-send-email-arnagara@qti.qualcomm.com>
Message-ID: <8d2a1b7efdc64924ac340344d036227a@euamsexm01a.eu.qualcomm.com>
Date: Fri, 9 Sep 2016 14:11:12 +0200
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, arnagara@codeaurora.org, ath10k@lists.infradead.org

Ashok Raj Nagarajan <arnagara@qti.qualcomm.com> wrote:
> When user requests for survey dump data, driver is providing wrong survey
> information. This information we sent is the survey data that we have
> collected during previous user request.
> 
> This issue occurs because we request survey dump for wrong channel. With
> this change, we correctly display the correct and current survey
> information to userspace.
> 
> Fixes: fa7937e3d5c2 ("ath10k: update bss channel survey information")
> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

77eb3d693182 ath10k: fix reporting channel survey data

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9310467/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
