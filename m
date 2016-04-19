Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asXr6-0000lP-Ov
 for ath10k@lists.infradead.org; Tue, 19 Apr 2016 15:46:26 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix return value for btcoex and peer stats debugfs
Date: Tue, 19 Apr 2016 15:46:00 +0000
Message-ID: <874maxk3f4.fsf@kamboji.qca.qualcomm.com>
References: <1459870106-2694-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1459870106-2694-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Tue, 5 Apr 2016 20:58:26	+0530")
Content-Language: en-US
Content-ID: <EFE97303BA8BC447B853AAB0B62F6117@qualcomm.com>
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "mohammed@codeaurora.org" <mohammed@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> Return value is incorrect for btcoex and peer stats debugfs
> 'write' entries if the user provides a value that matches with
> the already available debugfs entry, this results in the debugfs
> entry getting stuck and the operation has to be terminated manually.
> Fix this by returning the appropriate return 'count' as we do it for
> other debugfs entries like pktlog etc
>
> Fixes: cc61a1bbbc0e ("ath10k: enable debugfs provision to enable
> Peer Stats feature")
> Fixes: c28e6f06ff40 ("ath10k: fix sanity check on enabling btcoex via
> debugfs")
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Applied, thanks.

I removed the line wrapping from "Fixes:" lines.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
