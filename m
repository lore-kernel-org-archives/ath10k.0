Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cYdcc-000741-KO
 for ath10k@lists.infradead.org; Tue, 31 Jan 2017 18:57:44 +0000
Subject: Re: [PATCH v2] ath10k: add support for controlling tx power to a
 station
References: <1485888165-23504-1-git-send-email-arnagara@qti.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <cbb69298-391d-b3d5-5a84-5792fe170f95@candelatech.com>
Date: Tue, 31 Jan 2017 10:57:20 -0800
MIME-Version: 1.0
In-Reply-To: <1485888165-23504-1-git-send-email-arnagara@qti.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: arnagara@codeaurora.org, linux-wireless@vger.kernel.org

On 01/31/2017 10:42 AM, Ashok Raj Nagarajan wrote:
> This patch will add the support to control the transmit power for traffic
> to a station associated with the AP. Userspace provide the transmit power
> value in mBm units and the allowed range is from 0 to 70. Underlying FW

How did you come up with 70 mBm as the limit.  This is only 7dBm?

I would expect it to match the range of normal tx-power which is likely up to
30 dBm or so on some NICs (not counting regulatory limit).

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
