Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cX8a3-0000De-TL
 for ath10k@lists.infradead.org; Fri, 27 Jan 2017 15:36:53 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Driver support for QCA6174 chip using SDIO interface
Date: Fri, 27 Jan 2017 15:36:26 +0000
Message-ID: <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
In-Reply-To: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>	(Akesh
 M. Chacko's message of "Sat, 21 Jan 2017 19:52:24 +0530")
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
To: Akesh M Chacko <akesh.chacko@vvdntech.in>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Akesh M Chacko <akesh.chacko@vvdntech.in> writes:

> We are using QCA6174 chip on our embedded platform using SDIO
> interface. could you please help us to get the SDIO support for
> QCA6174 driver.

Erik Stromdahl is working on adding SDIO support to ath10k:

https://patchwork.kernel.org/patch/9516477/

But it's still WIP.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
