Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bqjFI-0003Hd-Ss
 for ath10k@lists.infradead.org; Sun, 02 Oct 2016 16:04:09 +0000
Received: by mail-qt0-x235.google.com with SMTP id s49so1252519qta.0
 for <ath10k@lists.infradead.org>; Sun, 02 Oct 2016 09:03:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1473188728-14995-1-git-send-email-twp@qca.qualcomm.com>
References: <1473188728-14995-1-git-send-email-twp@qca.qualcomm.com>
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Date: Mon, 3 Oct 2016 00:03:45 +0800
Message-ID: <CAEFj986nVFxhMv6hWuvfdOODGsOO-+Zv2=S0BZa6XrL=-W+NUA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: enable peer stats by default
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
To: Thomas Pedersen <twp@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Hi, Thomas

On Wed, Sep 7, 2016 at 3:05 AM, Thomas Pedersen <twp@qca.qualcomm.com> wrote:
> IFTYPE_MESH_POINT need to rely on these for accurate path
> selection metrics. Other modes will probably also find

Both get expected throughput or get txrate are not available to
mac80211. So, is this useful by enabling it?

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
