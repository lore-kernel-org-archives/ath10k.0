Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0116.hostedemail.com ([216.40.44.116]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVjNp-0005Xf-Ft
 for ath10k@lists.infradead.org; Fri, 05 Aug 2016 17:58:10 +0000
Message-ID: <1470419862.28648.11.camel@perches.com>
Subject: Re: [PATCH] ath10k: hide kernel addresses from logs using %pK
 format specifier
From: Joe Perches <joe@perches.com>
Date: Fri, 05 Aug 2016 10:57:42 -0700
In-Reply-To: <1470318711-28986-1-git-send-email-c_mkenna@qti.qualcomm.com>
References: <1470318711-28986-1-git-send-email-c_mkenna@qti.qualcomm.com>
Mime-Version: 1.0
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
To: c_mkenna@qti.qualcomm.com, ath10k@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Cc: mkenna@codeaurora.org, linux-wireless@vger.kernel.org, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, 2016-08-04 at 19:21 +0530, c_mkenna@qti.qualcomm.com wrote:
> From: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
> 
> With the %pK format specifier we hide the kernel addresses
> with the help of kptr_restrict sysctl.
> In this patch, %p is changed to %pK in the driver code.
> 
> The sysctl is documented in Documentation/sysctl/kernel.txt.

Maybe %p should follow %pK and only show kernel .text addresses
by default and any other address as 0 unless the sysctl is set.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
