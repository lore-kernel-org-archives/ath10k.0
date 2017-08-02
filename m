Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcvRQ-0006zW-Ct
 for ath10k@lists.infradead.org; Wed, 02 Aug 2017 15:20:09 +0000
Message-ID: <1501687174.29303.357.camel@linux.intel.com>
Subject: Re: [PATCH v1] ath10k: Switch to use new generic UUID API
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 02 Aug 2017 18:19:34 +0300
In-Reply-To: <87d18erpuv.fsf@kamboji.qca.qualcomm.com>
References: <20170802135725.9317-1-andriy.shevchenko@linux.intel.com>
 <87d18erpuv.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, 2017-08-02 at 14:44 +0000, Kalle Valo wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> 
> > There are new types and helpers that are supposed to be used in new
> > code.
> > 
> > As a preparation to get rid of legacy types and API functions do
> > the conversion here.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> To which tree are you planning to submit this? Can I take this to my
> ath.git tree?

I guess it's precisely for your tree.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
