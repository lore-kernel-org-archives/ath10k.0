Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0oQW-0006A9-2k
 for ath10k@lists.infradead.org; Wed, 08 Jan 2014 08:23:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 6/7] ath10k: Use new interfaces for MSI enablement
References: <cover.1389103215.git.agordeev@redhat.com>
 <dc640013c28e6e24b4f7293a8adbd2b60a8f48c4.1389103215.git.agordeev@redhat.com>
Date: Wed, 8 Jan 2014 10:23:18 +0200
In-Reply-To: <dc640013c28e6e24b4f7293a8adbd2b60a8f48c4.1389103215.git.agordeev@redhat.com>
 (Alexander Gordeev's message of "Tue, 7 Jan 2014 19:05:41 +0100")
Message-ID: <87txdehog9.fsf@kamboji.qca.qualcomm.com>
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
To: Alexander Gordeev <agordeev@redhat.com>
Cc: linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Alexander Gordeev <agordeev@redhat.com> writes:

> This update also fixes a stylistic (naming and messaging only)
> confusion of MSI-X vs multiple MSIs which are not the same.
>
> Signed-off-by: Alexander Gordeev <agordeev@redhat.com>

Looks good to me.

Acked-by: Kalle Valo <kvalo@qca.qualcomm.com>

Do you want me to take this patch to my ath.git tree or how were you
planning to handle it?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
