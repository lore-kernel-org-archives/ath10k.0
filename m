Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqQF-0003ss-N8
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 15:30:28 +0000
MIME-Version: 1.0
Subject: Re: ath10k: hide kernel addresses from logs using %pK format specifier
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1470318711-28986-1-git-send-email-c_mkenna@qti.qualcomm.com>
Message-ID: <539a89901cc14f9a8a938a4d41f185cd@euamsexm01a.eu.qualcomm.com>
Date: Fri, 2 Sep 2016 17:29:56 +0200
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
To: c_mkenna@qti.qualcomm.com
Cc: mkenna@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

c_mkenna@qti.qualcomm.com wrote:
> From: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
> 
> With the %pK format specifier we hide the kernel addresses
> with the help of kptr_restrict sysctl.
> In this patch, %p is changed to %pK in the driver code.
> 
> The sysctl is documented in Documentation/sysctl/kernel.txt.
> 
> Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

75b34800a228 ath10k: hide kernel addresses from logs using %pK format specifier

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9263691/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
