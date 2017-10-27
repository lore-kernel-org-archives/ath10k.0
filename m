Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e89tL-0006GE-4W
 for ath10k@lists.infradead.org; Fri, 27 Oct 2017 19:02:05 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: ath10k-regression due to "ath10k: fix napi_poll budget overflow"
 c9353bf483d3
Date: Fri, 27 Oct 2017 19:01:32 +0000
Message-ID: <72e73df5-c261-cb1a-7fba-b1a3a9019fea@qti.qualcomm.com>
References: <5a4860eb-3734-7587-d81f-9c3de6ff11c8@leemhuis.info>
 <46f918c5-b07d-e397-2f3d-8136c7c1a8f3@qti.qualcomm.com>
 <fa6e3ee2-91b5-a54b-afe3-87f30aac7a48@leemhuis.info>
 <877evh53p8.fsf_-_@kamboji.qca.qualcomm.com>
In-Reply-To: <877evh53p8.fsf_-_@kamboji.qca.qualcomm.com>
Content-Language: en-US
Content-ID: <E34AF6CECF93BF4EACD3F4FA5B4A6C57@qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Thorsten Leemhuis <linux@leemhuis.info>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 10/27/2017 02:40 AM, Kalle Valo wrote:

> + linux-wireless
>
> Sorry, I have not been able to follow this discussion very closely but
> was the conclusion? Should we should revert c9353bf483d3 for 4.14 or
> what? I should still have time to do that, but not much.

Kalle, I don't think I have enough time to look into the issue, since original change is to avoid the warning, but now is having regression.
Let's try to revert c9353bf483d3 for 4.14, and I'll look into this later.

-- 
Ryan Hsu
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
