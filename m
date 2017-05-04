Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6GNc-0000jF-1l
 for ath10k@lists.infradead.org; Thu, 04 May 2017 13:01:20 +0000
MIME-Version: 1.0
Subject: Re: ath10k: append the wmi_op_version to testmode get_version cmd
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1493155156-22697-1-git-send-email-ryanhsu@qti.qualcomm.com>
References: <1493155156-22697-1-git-send-email-ryanhsu@qti.qualcomm.com>
Message-ID: <f2affc9fdafb443b962a418be6d2470b@eusanexr01a.eu.qualcomm.com>
Date: Thu, 4 May 2017 06:00:47 -0700
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
To: ryanhsu@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

ryanhsu@qti.qualcomm.com wrote:
> From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
> 
> QCA9xxx and QCA61x4/QCA93xx are using different wmi operation, in order
> for userspace to differentiate it, appends the wmi_op_version information
> alone with the get_version command.
> 
> Signed-off-by: Ryan Hsu <ryanhsu@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

4dcb78085d56 ath10k: append the wmi_op_version to testmode get_version cmd

-- 
https://patchwork.kernel.org/patch/9699775/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
