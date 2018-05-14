Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIEop-0008Av-H6
 for ath10k@lists.infradead.org; Mon, 14 May 2018 14:51:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] ath: Add support to get the detected radar
 specifications
References: <1525110339-25326-1-git-send-email-srirrama@codeaurora.org>
 <1525110339-25326-2-git-send-email-srirrama@codeaurora.org>
 <cf60f81c-9466-ac52-e902-413fe3163490@bowerswilkins.com>
Date: Mon, 14 May 2018 17:51:04 +0300
In-Reply-To: <cf60f81c-9466-ac52-e902-413fe3163490@bowerswilkins.com> (Peter
 Oh's message of "Mon, 30 Apr 2018 12:01:45 -0700")
Message-ID: <871sees33b.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <peter.oh@bowerswilkins.com>
Cc: linux-wireless@vger.kernel.org, Sriram R <srirrama@codeaurora.org>, ath10k@lists.infradead.org

Peter Oh <peter.oh@bowerswilkins.com> writes:

> On 04/30/2018 10:45 AM, Sriram R wrote:
>> This enables ath10k/ath9k drivers to collect the specifications of the
>> radar type once it is detected by the dfs pattern detector unit.
>> Usage of the collected info is specific to driver implementation.
>> For example, collected radar info could be used by the host driver
>> to send to co-processors for additional processing/validation.
>
> What kind of additional processing/validation does it do?
> Please give us more details for that.

This is handled in patch 2.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
