Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdMCh-0006YH-Qj
 for ath10k@lists.infradead.org; Wed, 01 Apr 2015 17:13:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: mac: match wait_for_completion_timeout return type
References: <1426271886-20562-1-git-send-email-hofrat@osadl.org>
Date: Wed, 1 Apr 2015 20:12:53 +0300
In-Reply-To: <1426271886-20562-1-git-send-email-hofrat@osadl.org> (Nicholas Mc
 Guire's message of "Fri, 13 Mar 2015 14:38:06 -0400")
Message-ID: <87ego3zsa2.fsf@kamboji.qca.qualcomm.com>
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
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Nicholas Mc Guire <hofrat@osadl.org> writes:

> Return type of wait_for_completion_timeout is unsigned long not int.
> An appropriately named unsigned long is added, respectively 'ret'
> renamed, and the assignments fixed up.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
