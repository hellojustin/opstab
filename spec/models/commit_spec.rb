require 'spec_helper'

describe Commit do

  #it_should_behave_like 'ActiveModel'

  describe '.new' do

    it 'can instantiate and instance from a hash of parameters' do
    
      params = {
        :branch     => 'myBranch', 
        :comment    => 'Hey I made a commit!',
        :committer  => 'someone@example.com',
        :date       => 'Sun Jan 6 23:42:19 2013 -0500',
        :diff       => 'a big long block of code with +\'s and -\'s',
        :repository => 'reponame',
        :revision   => '74da5392f71ad26c43f7c0e5b2766567f3db8e87'
      }

      commit = Commit.new( params )
      
      expect( commit.branch ).to     eq( params[:branch] )
      expect( commit.comment ).to    eq( params[:comment] )
      expect( commit.committer ).to  eq( params[:committer] )
      expect( commit.date ).to       eq( params[:date] )
      expect( commit.diff ).to       eq( params[:diff] )
      expect( commit.repository ).to eq( params[:repository] )
      expect( commit.revision ).to   eq( params[:revision] )

    end

  end

end
