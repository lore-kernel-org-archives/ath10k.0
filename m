Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKS8c-0001Dx-5z
 for ath10k@lists.infradead.org; Thu, 21 Aug 2014 13:10:47 +0000
Message-ID: <1408626616.4388.0.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH v8 2/4] ath10k: provide firmware crash info via debugfs
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 21 Aug 2014 15:10:16 +0200
In-Reply-To: <20140821124907.27159.64620.stgit@potku.adurom.net>
 (sfid-20140821_144916_865910_8B25D7B4)
References: <20140821124705.27159.67898.stgit@potku.adurom.net>
 <20140821124907.27159.64620.stgit@potku.adurom.net>
 (sfid-20140821_144916_865910_8B25D7B4)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, 2014-08-21 at 15:49 +0300, Kalle Valo wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Store the firmware registers and other relevant data to a firmware crash dump
> file and provide it to user-space via debugfs. Should help with figuring out
> why the firmware crashed.

So we just discussed Tuesday/yesterday that I'll be writing a generic
framework to provide this data to userspace, maybe you want to wait for
that.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
