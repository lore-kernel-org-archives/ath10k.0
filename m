Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSky7-00012n-20
 for ath10k@lists.infradead.org; Wed, 05 Jul 2017 14:07:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Switching away from ath10k patchwork project
Date: Wed, 5 Jul 2017 13:29:20 +0000
Message-ID: <87tw2rgggu.fsf@kamboji.qca.qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

TL;DR:

Starting from patches submitted today I'm switching away from
ath10k specific patchwork project to the general linux-wireless
patchwork project.

The longer story:

For legacy reasons we have had two patchwork projects, the main project
being linux-wireless (which tracks linux-wireless mailing list):

https://patchwork.kernel.org/project/linux-wireless/list/?state=*

And then we have a separate project for ath10k (which tracks the ath10k
mailing list):

https://patchwork.kernel.org/project/ath10k/list/?state=*

This creates a confusion as people don't always know which patchwork
project to follow. To simplify this I'm dropping the ath10k project in
patchwork and track also ath10k patches using the general linux-wireless
project so that all wireless patches can be tracked from the same
patchwork project.

The only downside from this is that if someone posts a patch only to the
ath10k list and forgets to CC linux-wireless I will not see it as I only
take patches from patchwork. But we have instructed everyone to CC
linux-wireless anyway[1] so hopefully this is a small problem. I do
remember having few cases where the patch was not CCed to
linux-wireless, but usually it's actually the other way around (people
forget to CC the ath10k list). So I'm not expecting that much problems
with this change.

[1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
