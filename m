Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7xmT-0005HZ-Sy
 for ath10k@lists.infradead.org; Tue, 09 May 2017 05:33:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] net: wireless: ath: ath10k: remove unnecessary code
Date: Tue, 9 May 2017 05:33:28 +0000
Message-ID: <87lgq6387s.fsf@kamboji.qca.qualcomm.com>
References: <20170509042159.GA19727@embeddedgus>
In-Reply-To: <20170509042159.GA19727@embeddedgus> (Gustavo A. R. Silva's
 message of "Mon, 8 May 2017 23:21:59 -0500")
Content-Language: en-US
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
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Gustavo A. R. Silva" <garsilva@embeddedor.com> writes:

> The name of an array used by itself will always return the array's address.
> So these tests will always evaluate as false and therefore the _return_
> will never be executed.
>
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

I don't understand the commit log, especially what does "The name of an
array used by itself" mean?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
