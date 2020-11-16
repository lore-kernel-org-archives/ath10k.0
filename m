Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keav2-0003tZ-64
 for ath10k@lists.infradead.org; Mon, 16 Nov 2020 09:35:32 +0000
MIME-Version: 1.0
Date: Mon, 16 Nov 2020 17:33:34 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: drivers/net/wireless/ath/ath10k/sdio.c:2234:2: warning:
 Non-boolean value returned from function returning bool
In-Reply-To: <87o8jx20w6.fsf@codeaurora.org>
References: <20201116055212.GA3723@shao2-debian>
 <87o8jx20w6.fsf@codeaurora.org>
Message-ID: <32eb018069a079fd82e359d0ed4e1b1e@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, kernel test robot <rong.a.chen@intel.com>

On 2020-11-16 15:53, Kalle Valo wrote:
> + ath10k list
> 
> kernel test robot <rong.a.chen@intel.com> writes:
> 
>> tree:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
>> master
>> head:   f01c30de86f1047e9bae1b1b1417b0ce8dcd15b1
>> commit: 3c45f21af84eb05a355919abc80cf70a3a681cee ath10k: sdio: add
>> firmware coredump support
>> compiler: nios2-linux-gcc (GCC) 9.3.0
>> 
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>> 
>> 
>> cppcheck possible warnings: (new ones prefixed by >>, may not real 
>> problems)
>> 
>>>> drivers/net/wireless/ath/ath10k/sdio.c:2234:2: warning: Non-boolean
>> value returned from function returning bool
>> [returnNonBoolInBooleanFunction]
>>     return param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW;
>>     ^
> 
> Is this really a problem? I guess we could change that to "!!(param &
> HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW)" but how is that better and
> does it make any practical difference when
> ath10k_sdio_is_fast_dump_supported() returns a boolean anyway?
It should not be a real problem by test before.
ath10k_sdio_is_fast_dump_supported return true in test before.
and fast_dump get true from ath10k_sdio_is_fast_dump_supported in 
ath10k_sdio_fw_crashed_dump.

the risk maybe like this:
u32 param in ath10k_sdio_is_fast_dump_supported is 4 bytes, and bool is 
1 byte.
if Gcc does not do any convertion from u32 to bool, then the bool value 
will only
get the lower byte(byte 0) of the 4 bytes, then maybe get an mistake 
result.

I did a disassemble of sdio.o with/without below change, and dump 
sdio.o, it have no difference in this place:
I change send a patch with below change if needed.
@@ -2231,7 +2231,7 @@ static bool 
ath10k_sdio_is_fast_dump_supported(struct ath10k *ar)

         ath10k_dbg(ar, ATH10K_DBG_SDIO, "sdio hi_option_flag2 %x\n", 
param);

-       return param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW;
+       return !!(param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW);
  }

objdump -Sl sdio.o > sdio.o-Sl.txt

0000000000002b00 <ath10k_sdio_fw_crashed_dump>:
void ath10k_sdio_fw_crashed_dump(struct ath10k *ar)
{
...
/home/wgong/ath11k/ath-master/ath/drivers/net/wireless/ath/ath10k/sdio.c:2234

	return param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW;
     2b75:	8b 44 24 44          	mov    0x44(%rsp),%eax
     2b79:	25 00 08 00 00       	and    $0x800,%eax //"the SF, ZF, and PF 
flags are set according to the result".ZF will be 0 if true.
     2b7e:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
     2b82:	40 0f 95 c5          	setne  %bpl //"Set byte if not equal 
(ZF=0)".stored the ZF flag to bpl as value of fast_dump.
ath10k_sdio_fw_crashed_dump():
/home/wgong/ath11k/ath-master/ath/drivers/net/wireless/ath/ath10k/sdio.c:2483
	char guid[UUID_STRING_LEN + 1];
	bool fast_dump;

	fast_dump = ath10k_sdio_is_fast_dump_supported(ar);

	if (fast_dump)
     2b86:	0f 85 c3 03 00 00    	jne    2f4f 
<ath10k_sdio_fw_crashed_dump+0x44f> //"Jump near if not equal (ZF=0)"
...
/home/wgong/ath11k/ath-master/ath/drivers/net/wireless/ath/ath10k/sdio.c:2499
	ath10k_sdio_dump_registers(ar, crash_data, fast_dump);
     2be5:	40 0f b6 d5          	movzbl %bpl,%edx //use the bpl stored as 
value of fast_dump
     2be9:	48 89 de             	mov    %rbx,%rsi
     2bec:	4c 89 ff             	mov    %r15,%rdi
     2bef:	e8 8c fb ff ff       	callq  2780 <ath10k_sdio_dump_registers>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
