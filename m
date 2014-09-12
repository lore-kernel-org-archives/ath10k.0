Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSOz3-0002Vn-O5
 for ath10k@lists.infradead.org; Fri, 12 Sep 2014 11:25:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC PATCH 3/3] ath10k: add cal_data debugfs file
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
 <20140911203152.12514.95332.stgit@potku.adurom.net>
 <5412260F.80607@candelatech.com>
Date: Fri, 12 Sep 2014 14:25:01 +0300
In-Reply-To: <5412260F.80607@candelatech.com> (Ben Greear's message of "Thu,
 11 Sep 2014 15:45:35 -0700")
Message-ID: <87sijxxer6.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 09/11/2014 01:31 PM, Kalle Valo wrote:
>> Provide calibration data used by the firmware to user space via a debugfs file.
>> This makes it easier to debug calibration related problems.
>>
>> Example:
>>
>> sudo cp /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data 1.cal
>
> Is this data that could be made human readable, or does it need to
> be parsed by some private tool?

A private tool is needed for this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
