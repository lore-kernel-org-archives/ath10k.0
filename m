Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anR6c-000569-VG
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 13:33:27 +0000
MIME-Version: 1.0
Date: Tue, 05 Apr 2016 19:02:56 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 1/3] ath10k: fix calibration init sequence of qca99x0
In-Reply-To: <871t6kcjoo.fsf@kamboji.qca.qualcomm.com>
References: <1459352551-11773-1-git-send-email-rmanohar@qti.qualcomm.com>
 <871t6kcjoo.fsf@kamboji.qca.qualcomm.com>
Message-ID: <4d0be6a7b9bf219f751a2f64a18e8553@codeaurora.org>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

On 2016-04-05 18:10, Valo, Kalle wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
>> pre-calibration is meant for qca4019 which contains only caldata
>> whereas calibration file is used by ar9888 and qca99x0 that contains
>> both board data and caldata. So by definition both pre-cal-file and
>> cal-file can not coexist. Keeping them in shared memory (union), is
>> breaking boot sequence of qca99x0. Fix it by storing both binaries
>> in separate memories. This issue is reported in ipq8064 platform which
>> includes caldata in flash memory.
>> 
>> Reported-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> 
> I added the fixes line in the pending branch:
> 
> Fixes: 3d9195ea19e4 ("ath10k: incorporate qca4019 cal data download 
> sequence")

Thanks.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
