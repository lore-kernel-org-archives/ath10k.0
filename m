Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQe2S-0004nL-LT
 for ath10k@lists.infradead.org; Tue, 02 Feb 2016 16:42:49 +0000
Received: by mail-pf0-x229.google.com with SMTP id 65so107886875pfd.2
 for <ath10k@lists.infradead.org>; Tue, 02 Feb 2016 08:42:28 -0800 (PST)
Date: Tue, 2 Feb 2016 22:12:12 +0530
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [RESEND,01/10] net: wireless: ath: Remove unnecessary semicolon
Message-ID: <20160202164212.GD8235@sudip-laptop>
References: <1445972565-14963-1-git-send-email-punitvara@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1445972565-14963-1-git-send-email-punitvara@gmail.com>
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
To: punit vara <punitvara@gmail.com>
Cc: netdev@vger.kernel.org, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On Wed, Oct 28, 2015 at 12:32:36AM +0530, punit vara wrote:
> This patch is to the htt_rx.c that removes unneeded semicolon which is
> reported by coccicheck.
> 
> Here semicolon just create empty statement so please remote it.

s/remote/remove

Instead of "net: wireless: ath: Remove unnecessary semicolon" the subject
should be "ath10k: Remove unnecessary semicolon"

and please combine this patch and the next patch as they are similar
change to the same driver.

regards
sudip

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
