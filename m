Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ablHS-0005Ub-Lx
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 08:40:15 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: remove impossible code
Date: Fri, 4 Mar 2016 08:39:49 +0000
Message-ID: <87io12zlf4.fsf@kamboji.qca.qualcomm.com>
References: <1454397280-4758-1-git-send-email-sudipm.mukherjee@gmail.com>
In-Reply-To: <1454397280-4758-1-git-send-email-sudipm.mukherjee@gmail.com>
 (Sudip Mukherjee's message of "Tue, 2 Feb 2016 12:44:40 +0530")
Content-Language: en-US
Content-ID: <4CCDF84B67B45B479043DACFA2D090AF@qualcomm.com>
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
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:

> From: Sudip Mukherjee <sudip@vectorindia.org>
>
> len has been initialized with a value of 0 and buf_len with 4096. There
> is no way that this condition (len > buf_len) can be true now.
>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
