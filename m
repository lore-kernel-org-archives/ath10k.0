Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLPgD-0000NQ-Hz
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 06:54:29 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: Replace warning with an error message if HTT op
 version is unset
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1466700001-4883-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <f38889b09514441d82aef5559b645dc2@euamsexm01a.eu.qualcomm.com>
Date: Fri, 8 Jul 2016 08:54:02 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Print an ath10k error message rather a call trace when HTT op version is
> not found from firmware META data (IE). This should be sufficient to figure
> out what went wrong.
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

ce30c4fe1a22 ath10k: replace warning with an error message if HTT op version is unset

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9195581/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
