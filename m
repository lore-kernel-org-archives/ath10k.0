Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YX5cs-0004Ke-KZ
 for ath10k@lists.infradead.org; Sun, 15 Mar 2015 10:18:31 +0000
Date: Sun, 15 Mar 2015 11:17:58 +0100
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH 2/2] ath10k: core: harmonize error case handling in
 ath10k_core_start
Message-ID: <20150315101758.GA28477@opentech.at>
References: <1426323313-1344-1-git-send-email-hofrat@osadl.org>
 <550497A0.5040508@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <550497A0.5040508@cogentembedded.com>
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>, Nicholas Mc Guire <hofrat@osadl.org>

On Sat, 14 Mar 2015, Sergei Shtylyov wrote:

> Hello.
>
> On 03/14/2015 11:55 AM, Nicholas Mc Guire wrote:
>
>> All of the bringup/init functions called in ath10k_core_start return 0 on
>> success and != 0 on failure - ath10k_wmi_wait_for_service_ready and
>> ath10k_wmi_wait_for_unified_ready were adjusted to fit this model and the
>> call sites here fixed up accordingly.
>
>    If you've changed the sense of these function's results, you need to  
> adjust the call sites in the same patch, because otherwise one wouldn't 
> be able to bisect this...
>

yup both patches would mess up if individually applied or reverted.
sorry my ignorance - did not think of that problem - will fix it 
up as a single patch and repost. 

thx!
hofrat

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
