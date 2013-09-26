Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP4Y8-0002jD-2e
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 05:55:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: implement firmware IE container support
References: <20130925210455.2596.36889.stgit@localhost6.localdomain6>
 <20130925210848.2596.56332.stgit@localhost6.localdomain6>
 <CA+BoTQ=BhtjC1YNLs9OYBPN6TiYhyrwYoK2A1wifS01HVJp1YA@mail.gmail.com>
Date: Thu, 26 Sep 2013 08:55:07 +0300
In-Reply-To: <CA+BoTQ=BhtjC1YNLs9OYBPN6TiYhyrwYoK2A1wifS01HVJp1YA@mail.gmail.com>
 (Michal Kazior's message of "Thu, 26 Sep 2013 07:46:16 +0200")
Message-ID: <878uykunyc.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Did you skip board file intentionally?

Yes, because my understanding is that the board file is not tied to any
particular firmware version. The board file should be specific to the
hardware configuration in use, or at least that's how it is with ath6kl.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
