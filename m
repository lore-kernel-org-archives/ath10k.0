Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJ9d-0006wn-CC
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 07:53:06 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: correct wmi_tlv command params to enable
 pktlog for WCN3990
References: <1558087516-666-3-git-send-email-aambure@codeaurora.org>
 <20190918134502.91240614C3@smtp.codeaurora.org>
Date: Mon, 23 Sep 2019 10:53:00 +0300
In-Reply-To: <20190918134502.91240614C3@smtp.codeaurora.org> (Kalle Valo's
 message of "Wed, 18 Sep 2019 13:45:02 +0000 (UTC)")
Message-ID: <87impja1pf.fsf@codeaurora.org>
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
To: Abhishek Ambure <aambure@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Abhishek Ambure <aambure@codeaurora.org> wrote:
>
>> PKT log enable command expects pdev id in enable params which is missing
>> in current configuration. Fill pdev id in pkt log enable wmi command for
>> correct configuration.
>> 
>> Fixes: ca996ec56608 ("ath10k: implement wmi-tlv backend")
>> Tested HW: WCN3990
>> Tested FW: WLAN.HL.3.1-00963-QCAHLSWMTPL-1
>> 
>> Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> How do I know this doesn't break QCA6174/QCA9377?

Abhishek mentioned me privately that he is checking this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
