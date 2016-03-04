Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ablIM-0006oo-GC
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 08:41:10 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: fix pktlog in QCA99X0
Date: Fri, 4 Mar 2016 08:40:46 +0000
Message-ID: <87a8mezldf.fsf@kamboji.qca.qualcomm.com>
References: <1454686969-5740-1-git-send-email-arnagara@qti.qualcomm.com>
In-Reply-To: <1454686969-5740-1-git-send-email-arnagara@qti.qualcomm.com>
 (Ashok Raj Nagarajan's message of "Fri, 5 Feb 2016 21:12:48 +0530")
Content-Language: en-US
Content-ID: <6F7EA0562A99D34D8E9464C2E4B34497@qualcomm.com>
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
To: "Nagarajan, Ashok Raj" <arnagara@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ashok Raj Nagarajan <arnagara@qti.qualcomm.com> writes:

> Currently, we are providing wrong payload data of pktlog to trace points.
> Data we receive from FW through copy engine 8 contains pktlog data alone.
> We don't need to parse anything in driver before handing it to trace
> points.
>
> Fixes: afb0bf7f530b ("ath10k: add support for pktlog in QCA99X0")
> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

Both applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
