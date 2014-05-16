Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlIaA-0008G0-8a
 for ath10k@lists.infradead.org; Fri, 16 May 2014 13:53:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2 V3] ath10k: Fix pmf for action frames
References: <1397467642-23544-1-git-send-email-marek.kwaczynski@tieto.com>
 <1397467642-23544-2-git-send-email-marek.kwaczynski@tieto.com>
Date: Fri, 16 May 2014 16:53:27 +0300
In-Reply-To: <1397467642-23544-2-git-send-email-marek.kwaczynski@tieto.com>
 (Marek Kwaczynski's message of "Mon, 14 Apr 2014 11:27:22 +0200")
Message-ID: <87fvk94yp4.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Kwaczynski <marek.kwaczynski@tieto.com>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Kwaczynski <marek.kwaczynski@tieto.com> writes:

> Fix sending and receiveing protected managment frames.
> Lack of protected flag for received protected action frames
> causes report these frames as unprotected robust action frames.
> If the driver in AP mode sent frame with protected flag and
> CCMP header using IEEE80211_KEY_FLAG_SW_MGMT_TX flag,
> the FW encrypted frames once again. From user side all
> received SA Query Requests and Responses were skipped and
> all protected action frames were sent as malformed packets.
>
> Signed-off-by: Marek Kwaczynski <marek.kwaczynski@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
