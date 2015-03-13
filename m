Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWSKR-0004Cf-Ud
 for ath10k@lists.infradead.org; Fri, 13 Mar 2015 16:20:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3 RFC] ath10k: wmi: match wait_for_completion_timeout
 return type
References: <1426175362-8640-1-git-send-email-hofrat@osadl.org>
Date: Fri, 13 Mar 2015 18:20:01 +0200
In-Reply-To: <1426175362-8640-1-git-send-email-hofrat@osadl.org> (Nicholas Mc
 Guire's message of "Thu, 12 Mar 2015 11:49:22 -0400")
Message-ID: <87bnjwrhse.fsf@kamboji.qca.qualcomm.com>
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
> An appropriately named unsigned long is added and the assignments fixed up.
> Rather than returning 0 (timeout) or a more or less random remaining time
> (completion success) this return 0 or 1 which also resolves the type of the
> functions being int.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Why does patch 2 in this patchset have RFC in the title but patches 1
and 3 not? That just makes me confused, I can't tell what you want me to
do with the patches. Normally I just drop all patches (or patchsets)
which have RFC, and that's what I'm going to do now.

To save everyone's time, when submitting something please state clearly
what's your intention.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
