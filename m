Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG1PP-0007SB-Sb
 for ath10k@lists.infradead.org; Sun, 01 Sep 2013 06:45:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: remove un ar_pci->cacheline_sz field
References: <20130802075601.11114.11607.stgit@localhost6.localdomain6>
Date: Sun, 1 Sep 2013 09:44:49 +0300
In-Reply-To: <20130802075601.11114.11607.stgit@localhost6.localdomain6> (Kalle
 Valo's message of "Fri, 02 Aug 2013 10:56:01 +0300")
Message-ID: <87sixp6nxa.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> cacheline_sz is not used anywhere and can be removed.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

I had sent this patch a month ago, but forgot to apply it. It's applied
now (after fixing a simple conflict).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
