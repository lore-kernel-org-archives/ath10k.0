Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZFCy-00012K-VQ
 for ath10k@lists.infradead.org; Fri, 26 Feb 2016 10:01:14 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: set MAC timestamp in management Rx frame
Date: Fri, 26 Feb 2016 10:00:35 +0000
Message-ID: <87bn73dc5a.fsf@kamboji.qca.qualcomm.com>
References: <4c705dc7a2c0aa857da4e6eaf6e8ed47c354b9ea.1456351768.git.poh@qca.qualcomm.com>
 <87k2lsd9zv.fsf@kamboji.qca.qualcomm.com>	<56CF4DA3.8030803@codeaurora.org>
In-Reply-To: <56CF4DA3.8030803@codeaurora.org> (Peter Oh's message of "Thu, 25
 Feb 2016 10:53:23 -0800")
Content-Language: en-US
Content-ID: <967789F9BC0B224CAB5B89396CF27A56@qualcomm.com>
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
To: Peter Oh <poh@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Oh,
 Peter" <poh@qca.qualcomm.com>

Peter Oh <poh@codeaurora.org> writes:

>> I see new warnings:
>>
>> drivers/net/wireless/ath/ath10k/wmi.c:2199:16: warning: restricted __le32
>> degrades to integer
>> drivers/net/wireless/ath/ath10k/wmi.c:2201:41: warning: restricted __le32
>> degrades to integer
>> drivers/net/wireless/ath/ath10k/wmi.c:2201:41: warning: cast to restricted
>> __le32
>> drivers/net/wireless/ath/ath10k/wmi.c:2201:41: warning: restricted __le32
>> degrades to integer
>>
> Do I have a way to run this check before submitting a patch such as
> checkpatch.pl?

I use this script to run checks on ath10k before I apply a patch to
pending branch:

https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-check

You need to install sparse separately, better to take the latest version
from git:

https://sparse.wiki.kernel.org/index.php/Main_Page

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
