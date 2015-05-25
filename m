Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YwwV4-00053N-Ip
 for ath10k@lists.infradead.org; Mon, 25 May 2015 17:49:19 +0000
References: <1431434736-7077-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=dzJS447Gx+XAXPT6gZDDKZ__6scbxe0QC-iMA47bZmQ@mail.gmail.com>
 <874mn68jl7.fsf@kamboji.qca.qualcomm.com>
 <87oal83kv4.fsf@kamboji.qca.qualcomm.com> <5563577E.4020208@dd-wrt.com>
 <5563584A.80604@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <55636088.1080506@dd-wrt.com>
Date: Mon, 25 May 2015 19:48:56 +0200
MIME-Version: 1.0
In-Reply-To: <5563584A.80604@candelatech.com>
Subject: Re: request: ACK timing setting required
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
To: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

Am 25.05.2015 um 19:13 schrieb Ben Greear:
>
>
> On 05/25/2015 10:10 AM, Sebastian Gottschall wrote:
>> Hello
>>
>> could it be possible to add a ACK timing feature to the ath10k 
>> firmware (QCA9880 internal register 0x8014, mask 0x3FFF)
>
> You just need ability to set this register to some value?
>
> If so, probably something I could add to CT firmware, at least.
>
not alone. this register is rewritten on each reset (channel change 
etc.) so it needs to be correct handled.
yes. just writing and handling the ack value would be enough. the math 
behind is no problem.
otherwise its impossible todo long range links with ath10k. (LSDK based 
firmware from compex do support this feature unlike ath10k)

for distance handling the following parameters must be adjustable (in 
ath9k we implemented the coverageclass attribute for it which was based 
on my previous work on madwifi)
since i just have a old ath10k firmware source which i never got working 
(working toolchain missing) i just write down you the register 
definitions here which must be adjustable.
the math etc. for calculating these values can be done later by me in ath10k
OS_REG_WRITE(MAC_DCU_GBL_IFS_SLOT_ADDRESS, 
MAC_DCU_GBL_IFS_SLOT_DURATION_SET(your_slot_time_here * 88)); //(default 
value is 9)
OS_REG_WRITE(MAC_DCU_GBL_IFS_SIFS_ADDRESS, 
MAC_DCU_GBL_IFS_SIFS_DURATION_SET(your_sifs_time_here * 88)); //(default 
value is 14)
OS_REG_WRITE(MAC_DCU_GBL_IFS_EIFS_ADDRESS, 
MAC_DCU_GBL_IFS_SIFS_DURATION_SET(your_eifs_time_here * 88)); //(default 
value is 92)
OS_REG_WRITE(MAC_PCU_ACK_CTS_TIMEOUT_ADDRESS, 
MAC_PCU_ACK_CTS_TIMEOUT_ACK_TIMEOUT_SET(your_ack_time_here * 88) ); // 
(default value is 30)
OS_REG_WRITE(MAC_PCU_ACK_CTS_TIMEOUT_ADDRESS, 
MAC_PCU_ACK_CTS_TIMEOUT_CTS_TIMEOUT_SET(your_cts_time_here * 88)); // 
(default value is 30)


these registers are prewritten using the ini array  named 
qca9880_peregrine_bimodal_asic_mac

its possible to adjust them using debugfs reg_value and reg_addr, but as 
i said on each channel change or internal reset, the registers are 
overwritten with default values. so best is to adjust them direct
after registers are written from ini array.


> Thanks,
> Ben
>
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
