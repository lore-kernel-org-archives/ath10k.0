Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBdQD-0002w6-89
 for ath10k@lists.infradead.org; Fri, 28 Aug 2020 12:23:58 +0000
MIME-Version: 1.0
Date: Fri, 28 Aug 2020 20:23:52 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: add flag to protect napi operation to avoid
 dead loop hang for SDIO
In-Reply-To: <CABPxzYJ982LdcUD3a_tyu3rrqp+iacZrmAp4zG_3HqCiDCR_2w@mail.gmail.com>
References: <1598243612-4627-1-git-send-email-wgong@codeaurora.org>
 <CABPxzYLjys+cXXRM5J680ZOs+6VrYt=_3rWv-gqkCod=-A1VrA@mail.gmail.com>
 <fd98989a87f2a50655dc95bdcd535c0d@codeaurora.org>
 <CABPxzYKvPwtQwxMfRcv9jT+d92ErhYGR91SKBH86T3Rd2QH9Qg@mail.gmail.com>
 <2d6362ce85956d0f7df2e596b89a7028@codeaurora.org>
 <CABPxzY+Fc22ke1ygRnDs0Uds0a7n=792QN8ALXciDrnx9SQuqQ@mail.gmail.com>
 <663fbb682fd8df555b2964d7d86b8eca@codeaurora.org>
 <CABPxzYJ982LdcUD3a_tyu3rrqp+iacZrmAp4zG_3HqCiDCR_2w@mail.gmail.com>
Message-ID: <37ae0f512cb677128fbb613e4b64d4c0@codeaurora.org>
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
To: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 2020-08-25 16:24, Krishna Chaitanya wrote:
v3 sent: https://patchwork.kernel.org/patch/11742675/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
