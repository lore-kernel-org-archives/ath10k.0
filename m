Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcutX-0000Fp-4M
 for ath10k@lists.infradead.org; Wed, 02 Aug 2017 14:45:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v1] ath10k: Switch to use new generic UUID API
Date: Wed, 2 Aug 2017 14:44:41 +0000
Message-ID: <87d18erpuv.fsf@kamboji.qca.qualcomm.com>
References: <20170802135725.9317-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20170802135725.9317-1-andriy.shevchenko@linux.intel.com> (Andy
 Shevchenko's message of "Wed, 2 Aug 2017 16:57:25 +0300")
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> There are new types and helpers that are supposed to be used in new code.
>
> As a preparation to get rid of legacy types and API functions do
> the conversion here.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

To which tree are you planning to submit this? Can I take this to my
ath.git tree?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
