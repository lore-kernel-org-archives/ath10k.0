Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHsPl-0003AP-GS
 for ath10k@lists.infradead.org; Fri, 06 Sep 2013 09:33:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] Add missing braces to ath10k_pci_tx_pipe_cleanup
References: <20130905035128.GA15824@redhat.com>
Date: Fri, 6 Sep 2013 12:32:43 +0300
In-Reply-To: <20130905035128.GA15824@redhat.com> (Dave Jones's message of
 "Wed, 4 Sep 2013 23:51:28 -0400")
Message-ID: <87mwnqi9c4.fsf@kamboji.qca.qualcomm.com>
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
To: Dave Jones <davej@redhat.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linville@tuxdriver.com, ath10k@lists.infradead.org

Dave Jones <davej@redhat.com> writes:

> The indentation here implies this was meant to be a multi-statement
> if, but it lacks the braces.
>
> Signed-off-by: Dave Jones <davej@fedoraproject.org>

Thanks, applied.

I added "ath10k:" to the patch title.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
